import classes from './RequestList.module.css';
import firebase from '../../firebase'
import { useState, useEffect } from 'react'

const ref = firebase.firestore().collection("requests");
const refBook = firebase.firestore().collection("bookings");

const RequestList = () => {

  const [requests, setRequests] = useState([]);
  const [loading, setLoading] = useState(false);

    function acceptRequest(request){
      refBook.doc(request.uid).set(request);
      refBook.doc(request.uid).update({status: "accepted",});
      ref.doc(request.uid).delete();
    }

    function declineRequest(request){
      refBook.doc(request.uid).set(request);
      refBook.doc(request.uid).update({status: "declined"});
      ref.doc(request.uid).delete();
    }

  function getRequests() {
    setLoading(true);
    ref.onSnapshot((querySnapshot) => {
      const items = [];
      querySnapshot.forEach((doc) => {
        items.push(doc.data());
      });
      setRequests(items);
      setLoading(false);
    })
  }

  useEffect(() => {
    getRequests();
  }, []);

  if (loading){
    return <h1>Loading</h1>;
  }

  return (
    <header>
      <h1 className={classes.title}>Request List</h1>
      {requests.map((request) => (
        <div key={request.uid}>
          <section className={classes.auth}>
            <div>Camera Id: {request.rid}</div>
            <div>Start Date: {request.startDate}</div>
            <div>End Date: {request.endDate}</div>
            <div>Status: {request.status}</div>
            {/* <button onClick={() => deleteRoom(room)}>Delete Room</button> */}
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