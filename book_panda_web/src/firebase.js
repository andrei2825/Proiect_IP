import firebase from 'firebase/compat/app';
import "firebase/compat/firestore";

const firebaseConfig = {
  apiKey: "AIzaSyAqRoLrG93DKZ6Ij9TnjUBvzim6NLDn97Q",
  authDomain: "bookpanda-daf35.firebaseapp.com",
  projectId: "bookpanda-daf35",
  storageBucket: "bookpanda-daf35.appspot.com",
  messagingSenderId: "316384541812",
  appId: "1:316384541812:web:0b97e00ef79b197931a521",
  measurementId: "G-ZG6KX7Z06V"
};

firebase.initializeApp(firebaseConfig);

export default firebase;