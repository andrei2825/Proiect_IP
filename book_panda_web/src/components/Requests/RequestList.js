import classes from './RequestList.module.css';
import firebase from '../../firebase'
import { useState, useEffect } from 'react'

const ref = firebase.firestore().collection("requests");
const refBook = firebase.firestore().collection("bookings");

const RequestList = () => {

  const [requests, setRequests] = useState([]);

    function acceptRequest(request){
      refBook.doc(request.requestId).set(request);
      refBook.doc(request.requestId).update({status: "accepted",}).then(() => {
        alert("request accepted");
        window.location.reload();
    });
      ref.doc(request.requestId).delete();
    }

    function declineRequest(request){
      refBook.doc(request.requestId).set(request);
      refBook.doc(request.requestId).update({status: "declined"}).then(() => {
        alert("request declined");
        window.location.reload();
    });
      ref.doc(request.requestId).delete();
    }

  function getRequests() {
    ref.onSnapshot((querySnapshot) => {
      const items = [];
      querySnapshot.forEach((doc) => {
        items.push(doc.data());
      });
      setRequests(items);
    })
  }

  useEffect(() => {
    getRequests();
  }, []);

  return (
    <header>
      <h1 className={classes.title}>Request List</h1>
      {requests.map((request) => (
        <div key={request.requestId}>
          <section className={classes.auth}>
            <div>Camera Id: {request.rid}</div>
            <div>Start Date: {request.startDate}</div>
            <div>End Date: {request.endDate}</div>
            <div>Status: {request.status}</div>
            <button onClick={() => acceptRequest(request)}>Accept</button>
            <button onClick={() => declineRequest(request)}>Decline</button>
          </section>
        </div>
      ))}
    </header>

  );
};

export {ref};
export default RequestList;