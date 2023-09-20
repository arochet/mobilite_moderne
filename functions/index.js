/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const algoliasearch = require("algoliasearch");


const ALGOLIA_APP_ID = "PTYE9X0MA9";
const ALGOLIA_ADMIN_KEY = "7a8fcacc9c5c0a94816cb7e23ae416bf";
const ALGOLIA_INDEX_NAME = "DistAtelier";


admin.initializeApp(functions.config().firebase);


// Création d'une resource
exports.createPost = functions.firestore.document("resources/{ResourcesID}").onCreate(async (snap, context) => {
    const newValue = snap.data();
    newValue.objectID = snap.id;

    const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

    const index = client.initIndex(ALGOLIA_INDEX_NAME);
    index.saveObject(newValue);
  });

// Mis à jour d'une resource
exports.updatePost = functions.firestore.document("resources/{ResourcesID}").onUpdate(async (snap, context) => {
    const afterUpdate = snap.after.data();
    afterUpdate.objectID = snap.after.id;

    const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

    const index = client.initIndex(ALGOLIA_INDEX_NAME);
    index.saveObject(afterUpdate);
    // console.log('finished 2');
  });

// Suppression d'une resource
exports.deletePost = functions.firestore.document("resources/{ResourcesID}").onDelete(async (snap, context) => {
    const oldId = snap.id;
    const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

    const index = client.initIndex(ALGOLIA_INDEX_NAME);
    index.deleteObject(oldId);
    console.log("finished 2");
  });
