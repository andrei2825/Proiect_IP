import classes from './RoomList.module.css';
import firebase from '../../firebase'
import { useState, useEffect } from 'react'
import NewRoom from './NewRoom'

const ref = firebase.firestore().collection("rooms");

const RoomList = () => {

  const [rooms, setRooms] = useState([]);
  const [loading, setLoading] = useState(false);

  function deleteRoom(room){
    ref.doc(room.rid).delete();
  }

  function getRooms() {
    setLoading(true);
    ref.onSnapshot((querySnapshot) => {
      const items = [];
      querySnapshot.forEach((doc) => {
        items.push(doc.data());
      });
      setRooms(items);
      setLoading(false);
    })
  }

  useEffect(() => {
    getRooms();
  }, []);

  if (loading){
    return <h1>Loading</h1>;
  }

  return (
    <header>
      <h1 className={classes.title}>Room List</h1>
      {rooms.map((room) => (
        <div key={room.rid}>
          <section className={classes.auth}>
            <div>Name: {room.title}</div>
            <div>Description: {room.description}</div>
            <div>Capacity: {room.capacity}</div>
            <div>Price: {room.price}</div>
            <div><img className={classes.photo} src={room.photosIds} alt="display"/></div>
            <button onClick={() => deleteRoom(room)}>Delete Room</button>
          </section>
        </div>
      ))}
      <NewRoom>
      </NewRoom>
    </header>

  );
};

export {ref};
export default RoomList;