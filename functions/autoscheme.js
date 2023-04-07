// import functions from "firebase-functions";
// import admin from "firebase-admin";
// import { db } from "./index.js";
// import serviceAccount from "./serviceAccountKey.json" assert { type: "json" };
// admin.initializeApp({
//   credential: admin.credential.cert(serviceAccount),
// });
import { db } from "./index.js";

// const db = admin.firestore();

export async function AutoScheme({ id }) {
  var applicationData = await db
    .doc(`Application/${id}`)
    .get()
    .then((value) => value.data());

  var schemeData = await db
    .doc(`Schemes/${applicationData["schemeId"]}`)
    .get()
    .then((value) => value.data());
  var userData = await db
    .doc(`Users/${applicationData["userId"]}`)
    .get()
    .then((value) => value.data());

  var checkedAge = checkAge({
    schemeAgeGrp: schemeData["ageGroup"],
    userAge: userData["dob"],
    gender: userData["gender"],
  });

  var checkedDisability = checkDisability({
    schemeDisability: schemeData["disabilityPercentage"],
    userDisability: userData["disabilitypercentage"],
  });

  if (checkedDisability && checkedAge) {
    await db.doc(`Users/${userData["userId"]}/AppliedScheme/${id}`).update({
      status: "The Application is Accepted and Scheme has been Activated",
      progress: 1,
    });
    await db.doc(`Application/${id}`).update({
      status: "The Application is Accepted and Scheme has been Activated",
      progress: 1,
    });
  } else if (checkedDisability && !checkedAge) {
    await db.doc(`Users/${userData["userId"]}/AppliedScheme/${id}`).update({
      status:
        "The Application was rejected due to age criteria , check the scheme details or find another applicable scheme",
      progress: 3,
    });
    await db.doc(`Application/${id}`).update({
      status:
        "The Application was rejected due to age criteria , check the scheme details or find another applicable scheme",
      progress: 3,
    });
  } else if (!checkedDisability && checkedAge) {
    await db.doc(`Users/${userData["userId"]}/AppliedScheme/${id}`).update({
      status:
        "The Application was rejected due to Disability type , check the scheme details or find another applicable scheme ",
      progress: 3,
    });
    await db.doc(`Application/${id}`).update({
      status:
        "The Application was rejected due to Disability type , check the scheme details or find another applicable scheme",
      progress: 3,
    });
  } else {
    await db.doc(`Users/${userData["userId"]}/AppliedScheme/${id}`).update({
      status:
        "Your criteria doesn't match , check the scheme details or find another applicable scheme",
      progress: 3,
    });
    await db.doc(`Application/${id}`).update({
      status: "Your criteria doesn't match , check the scheme details or find another applicable scheme",
      progress: 3,
    });
  }
}

function checkDisability({ schemeDisability, userDisability }) {
  var eligable = false;
  const regex = /(\d+)/; // Match one or more digits
  const schemeDisabilityNumRex = schemeDisability.match(regex);
  var userDisabilityInNumRex = userDisability.match(regex);
  const schemeDisabilityNum = schemeDisabilityNumRex[0];
  var userDisabilityInNum = userDisabilityInNumRex[0];

  switch (schemeDisabilityNum) {
    case 60:
      if (60 <= userDisabilityInNum) {
        eligable = true;
      }
      break;
    case 40:
      if (40 <= userDisabilityInNum) {
        eligable = true;
      }
      break;
    case 80:
      if (80 <= userDisabilityInNum) {
        eligable = true;
      }
      break;
  }
  return eligable;
}

function checkAge({ schemeAgeGrp, userAge, gender }) {
  var eligable = false;
  const dateString = userAge;
  const [day, month, year] = dateString.split("/");
  const dob = new Date(`${year}-${month}-${day}`);
  const ageInMilliseconds = Date.now() - dob.getTime();
  const ageofUser = Math.floor(
    ageInMilliseconds / (1000 * 60 * 60 * 24 * 365.25)
  );

  switch (schemeAgeGrp) {
    case "All":
      eligable = true;
      break;
    case "Above 18 years":
      if (ageofUser > 18) {
        eligable = true;
      }
      break;
    case "6-14 years":
      if (ageofUser > 5 && ageofUser < 15) {
        eligable = true;
      }
      break;
    case "18-30 years":
      if (ageofUser > 17 && ageofUser < 31) {
        eligable = true;
      }
      break;
    case "Below 55 years":
      if (ageofUser < 56) {
        eligable = true;
      }
      break;
    case "18-45 years":
      if (ageofUser > 17 && ageofUser < 46) {
        eligable = true;
      }
      break;
    case "Above 10 years":
      if (ageofUser > 9) {
        eligable = true;
      }
      break;
    case "15-18 years":
      if (ageofUser > 14 && ageofUser < 19) {
        eligable = true;
      }
      break;
    case "18-50 years":
      if (ageofUser > 17 && ageofUser < 51) {
        eligable = true;
      }
      break;
    case "18-79 years":
      if (ageofUser > 17 && ageofUser < 80) {
        eligable = true;
      }
      break;
    case "6-18 years":
      if (ageofUser > 17 && ageofUser < 80) {
        eligable = true;
      }
      break;
    case "18-60 years":
      if (ageofUser > 17 && ageofUser < 80) {
        eligable = true;
      }
      break;
    case "Female above 18 years & Male above 21 years":
      if (ageofUser > 17 && gender == "FEMALE") {
        eligable = true;
      } else if (ageofUser > 20 && gender == "MALE") {
        eligable = true;
      }
      break;
    case "Below 11 years":
      if (ageofUser < 12) {
        eligable = true;
      }
      break;
    case "18-35 years":
      if (ageofUser > 17 && ageofUser < 36) {
        eligable = true;
      }
      break;
    case "Below 60 years":
      if (ageofUser < 61) {
        eligable = true;
      }
      break;
    case "Above 16 years":
      if (ageofUser > 15) {
        eligable = true;
      }
      break;
    case "14-60 Years":
      if (ageofUser > 13 && ageofUser < 61) {
        eligable = true;
      }
      break;
    case "Below 18 years":
      if (ageofUser < 19) {
        eligable = true;
      }
      break;
    default:
      eligable = true;
      break;
  }
  return eligable;
}

// AutoScheme({ id: "gLwzZbgD7NEeeo5QRZ4q" });
