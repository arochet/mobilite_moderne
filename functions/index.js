const functions = require('firebase-functions');
const admin = require('firebase-admin');
const algoliasearch = require('algoliasearch');
const stripe = require('stripe')(functions.config().stripe.testkey); 

 
const ALGOLIA_APP_ID = 'PTYE9X0MA9';
const ALGOLIA_ADMIN_KEY = '7a8fcacc9c5c0a94816cb7e23ae416bf';
const ALGOLIA_INDEX_NAME = 'DistAtelier';

admin.initializeApp(functions.config().firebase);

//Pour chaque utilisateur créer
exports.createUser = functions.firestore
    .document('user/{userId}')
    .onCreate(async (snap, context) => {
        const db = admin.firestore();
    //Nouvelle valeur de UserData 
    userData = snap.data();

      //Création du compte Stripe
    const customer = await stripe.customers.create({
        description: userData.userName,
      });

      //On ajout l'id de l'utilisateur Stripe dans Firestore
      userData.idStripe = customer.id;
      db.doc('user/' + snap.id).set(userData);
    }); 

exports.deleteUser = functions.firestore
    .document('user/{userId}')
    .onDelete(async (snap, context) => {
    const db = admin.firestore();
    //Suppression du compte Stripe
    await stripe.customers.del(snap.id);
    }); 

// ABONNEMENT 
exports.SubscribeAccesTotal = functions.https.onRequest(async (req, res) => {
    const {
        idStripe,
    } = req.body;

    try {
        const subscription = await stripe.subscriptions.create({
            customer: idStripe,
            items: [{
              price: 'price_1O03zgLoHsD8ZYCOOvruig70',
            }],
            payment_behavior: 'default_incomplete',
            payment_settings: { save_default_payment_method: 'on_subscription' },
            expand: ['latest_invoice.payment_intent'],
          });

          console.log(subscription);

          res.send({
            subscriptionId: subscription.id,
            clientSecret: subscription.latest_invoice.payment_intent.client_secret,
          });
    } catch (e) {
        return res.status(400).send({ error: { message: error.message } });
    }
});

// Liste des abonnements
exports.ListSubscription = functions.https.onRequest(async (req, res) => {
    const { idStripe } = req.body;

    try {
        const listSubscription = await stripe.subscriptions.list({
            customer: idStripe,
            limit: 10,
          });

          //Rercherche de tous les abonnements 
          listSubscription.data.forEach(function (sub) {
            sub.items.data.forEach(function (item) {
                //Code du produit acces_total !
                if(item.price['product'] == 'prod_OnfKo1VMwQsFOV') {
                    //Retourne toute la subscription
                    res.status(200).send(sub);
                } 
            });
          });

          res.status(200).send( { message: 'Pas d abonnement trouvé ' + listSubscription.data.length });
    } catch (e) {
        return res.status(400).send({ error: { message: error.message } });
    }
});

// Suppression abonnement
exports.CancelSubscription = functions.https.onRequest(async (req, res) => {
    const { idSubscription } = req.body;

    try {
        const deleted = await stripe.subscriptions.cancel(idSubscription);
          res.status(200).send(deleted);
    } catch (e) {
        return res.status(400).send({ error: { message: error.message } });
    }
});

//DEPRECATED
// PAYEMENT STRIPE
const calculateOrderAmount = (items) => {
    prices = [];
    catalog = [
        { 'id': '0', 'price': 2.99 },
        { 'id': '1', 'price': 3.99 },
        { 'id': '2', 'price': 4.99 },
        { 'id': '3', 'price': 5.99 },
        { 'id': '4', 'price': 6.99 },
    ];

    items.forEach(item => {
        price = catalog.find(x => x.id == item.id).price;
        prices.push(price);
    });

    return parseInt(prices.reduce((a, b) => a + b) * 100);
};

//DEPRECATED
const generateResponse = function (intent) {
    // Generate a response based on the intent's status
    console.log(`generate response ${intent}`);
    switch (intent.status) {
        case 'requires_action':
            // Card requires authentication
            return {
                clientSecret: intent.client_secret,
                id: intent.id,
                requiresAction: true,
                status: intent.status,
            };
        case 'requires_confirmation':
            // Card requires authentication
            return {
                clientSecret: intent.client_secret,
                id: intent.id,
                requiresAction: true,
                status: intent.status,
            };
        case 'requires_payment_method':
            // Card was not properly authenticated, suggest a new payment method
            return {
                error: 'Your card was denied, please provide a new payment method',
            };
        case 'succeeded':
            // Payment is complete, authentication not required
            // To cancel the payment after capture you will need to issue a Refund (https://stripe.com/docs/api/refunds).
            console.log('💰 Payment received!');
            return { clientSecret: intent.client_secret, status: intent.status };
    }
    return {
        error: 'Failed',
    };
};

//DEPRECATED
exports.StripePayEndpointMethodId = functions.https.onRequest(async (req, res) => {
    const {
        paymentMethodId,
        items,
        currency,
        useStripeSdk,
    } = req.body;

    const orderAmount = calculateOrderAmount(items);

    try {
        if (paymentMethodId) {
            // Create new PaymentIntent with a PaymentMethod ID from the client.
            const params = {
                amount: orderAmount,
                confirm: true,
                currency,
                payment_method: paymentMethodId,
                use_stripe_sdk: useStripeSdk,
                automatic_payment_methods: {enabled: true, allow_redirects: 'never'},
            };
            const intent = await stripe.paymentIntents.create(params);

            return res.send(generateResponse(intent));
        }
        return res.sendStatus(400);
    } catch (e) {
        // Handle "hard declines" e.g. insufficient funds, expired card, etc
        // See https://stripe.com/docs/declines/codes for more.
        return res.send({ error: e.message });
    }
});

//DEPRECATED
exports.StripePayEndpointIntentId = functions.https.onRequest(async (req, res) => {
    const {
        paymentIntentId,
    } = req.body;

    try {
        if (paymentIntentId) {
            // Confirm the PaymentIntent to finalize payment after handling a required action
            // on the client.
            const intent = await stripe.paymentIntents.confirm(paymentIntentId);
            // After confirm, if the PaymentIntent's status is succeeded, fulfill the order.
            return res.send(generateResponse(intent));
        } return res.sendStatus(400);
    } catch (e) {
        // Handle "hard declines" e.g. insufficient funds, expired card, etc
        // See https://stripe.com/docs/declines/codes for more.
        return res.send({ error: e.message });
    }
});


//RESOURCE
// Création d'une resource
exports.createPost = functions.firestore.
    document('resources/{ResourcesID}').onCreate(async (snap, context) => {
      const newValue = snap.data();
      newValue.objectID = snap.id;

      const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

      const index = client.initIndex(ALGOLIA_INDEX_NAME);
      index.saveObject(newValue);
    });

// Mis à jour d'une resource
exports.updatePost = functions.firestore.
    document('resources/{ResourcesID}').onUpdate(async (snap, context) => {
      const afterUpdate = snap.after.data();
      afterUpdate.objectID = snap.after.id;

      const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

      const index = client.initIndex(ALGOLIA_INDEX_NAME);
      index.saveObject(afterUpdate);
      // console.log('finished 2');
    });

// Suppression d'une resource
exports.deletePost = functions.firestore.
    document('resources/{ResourcesID}').onDelete(async (snap, context) => {
      const oldId = snap.id;
      const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

      const index = client.initIndex(ALGOLIA_INDEX_NAME);
      index.deleteObject(oldId);
      console.log('finished 2');
    });


