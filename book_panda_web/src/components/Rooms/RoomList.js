import classes from './RoomList.module.css';
import firebase from '../../firebase'
import { useState, useEffect } from 'react'

const ref = firebase.firestore().collection("rooms");

const RoomList = () => {

  const [rooms, setRooms] = useState([]);
  const [loading, setLoading] = useState(false);
  const [title, setTitle] = useState();
  const [description, setDescription] = useState();
  const [capacity, setCapacity] = useState();
  const [price, setPrice] = useState();
  const [photosIds, setPhotosIds] = useState();

  function editRoom(room, title, description, capacity, price, photosIds){
    if(title !== ""){
      ref.doc(room.rid).update({
        title: title});
      document.getElementById("title1").value = ""
    }
    if(description !== ""){
      ref.doc(room.rid).update({
        description: description});
      document.getElementById("description1").value = ""
    } 
    if(capacity != null){
      ref.doc(room.rid).update({
        capacity: capacity});
      document.getElementById("capacity1").value = ""
    }
    if(price != null){
      ref.doc(room.rid).update({
        price: price});
      document.getElementById("price1").value = ""
    }
    if(photosIds !== ""){
      ref.doc(room.rid).update({
        photosIds: photosIds});
      document.getElementById("photosIds1").value = ""
    }
  };
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
            <div>Id: {room.rid}</div>
            <div>Name: {room.title}</div>
            <div>Description: {room.description}</div>
            <div>Capacity: {room.capacity}</div>
            <div>Price: {room.price}</div>
            <div><img className={classes.photo} src={room.photosIds} alt="display"/></div>
            <div><input type="text" id="title1" placeholder="Title" onChange={(e) => setTitle(e.target.value)}></input></div>
            <div><input type="text" id="description1" placeholder="Description" onChange={(e) => setDescription(e.target.value)}></input></div>
            <div><input type="number" id="capacity1" placeholder="Capacity" onChange={(e) => setCapacity(e.target.valueAsNumber)}></input></div>
            <div><input type="number" id="price1" placeholder="Price" onChange={(e) => setPrice(e.target.valueAsNumber)}></input></div>
            <div><input type="text" id="photosIds1" placeholder="Photo" onChange={(e) => setPhotosIds(e.target.value)}></input></div>
            <button onClick={() => editRoom(room, title, description, capacity, price, photosIds)}>Edit Room</button>
            <button onClick={() => deleteRoom(room)}>Delete Room</button>
          </section>
        </div>
      ))}
    </header>

  );
};

export {ref};
export default RoomList;