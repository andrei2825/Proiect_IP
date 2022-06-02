import classes from './BookingList.module.css';
import firebase from '../../firebase'
import { useState, useEffect } from 'react'

const ref = firebase.firestore().collection("bookings");

const BookingList = () => {

  const [bookings, setBookings] = useState([]);

  function getBookings() {
    ref.onSnapshot((querySnapshot) => {
      const items = [];
      querySnapshot.forEach((doc) => {
        items.push(doc.data());
      });
      setBookings(items);
    })
  }

  function deleteBooking(booking){
    ref.doc(booking.requestId).delete().then(() => {
      alert("booking deleted");
      window.location.reload();
  });
  }

  useEffect(() => {
    getBookings();
  }, []);

  return (
    <header>
      <h1 className={classes.title}>Booking List</h1>
      {bookings.map((booking) => (
        <div key={booking.requestId}>
          <section className={classes.auth}>
            <div>Camera Id: {booking.rid}</div>
            <div>Start Date: {booking.startDate}</div>
            <div>End Date: {booking.endDate}</div>
            <div>Status: {booking.status}</div>
            <button onClick={() => deleteBooking(booking)}>Delete Booking</button>
          </section>
        </div>
      ))}
    </header>

  );
};

export {ref};
export default BookingList;