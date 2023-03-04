// import { initializeApp, credential as _credential } from "firebase-admin";
import { data } from "./data.js";
import admin from "firebase-admin";
import serviceAccount from "./serviceAccountKey.json" assert { type: "json" };

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});
const db = admin.firestore();
async function uploadData() {
  data.forEach(async (data) => {
    await db.collection("Schemes").add(data);
  });
}

uploadData();

