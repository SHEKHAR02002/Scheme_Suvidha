import { db } from "./index.js";

export async function StoreNoification({ userid, msg }) {
  const now = new Date();
  var notificationRef = await db
    .collection(`Users/${userid}/NotificationCenter`)
    .add({
      msg: msg,
      date: now,
    });
  await db
    .doc(`Users/${userid}/NotificationCenter/${notificationRef.id}`)
    .update({
      notificationId: notificationRef.id,
    });
}
