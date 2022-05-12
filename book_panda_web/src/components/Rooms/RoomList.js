import classes from './RoomList.css';
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
    <section className={classes.rooms}>
      <h1>Room List</h1>
      <NewRoom>
      </NewRoom>
      {rooms.map((room) => (
        <div key={room.rid}>
          <h2>
            <h3>{room.title}</h3>
            <h4>Description: {room.description}</h4>
            <h4>Capacity: {room.capacity}</h4>
            <h4>Price: {room.price}</h4>
            <h4><img src={room.photosIds} alt="display"/></h4>
            <button onClick={() => deleteRoom(room)}>Delete Room</button>
          </h2>
        </div>
      ))}
    </section>

  );
};

export {ref};
export default RoomList;