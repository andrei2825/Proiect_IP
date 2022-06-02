import classes from './RoomList.module.css';
import firebase from '../../firebase'
import { useState, useEffect } from 'react'
import { Link } from "react-router-dom";

const ref = firebase.firestore().collection("rooms");

const RoomList = () => {

  const [rooms, setRooms] = useState([]);
  const [title, setTitle] = useState();
  const [description, setDescription] = useState();
  const [capacity, setCapacity] = useState();
  const [price, setPrice] = useState();
  const [photosIds, setPhotosIds] = useState();

  const [ridTitle, setRidTitle] = useState();
  const [ridDescription, setRidDescription] = useState();
  const [ridCapacity, setRidCapacity] = useState();
  const [ridPrice, setRidPrice] = useState();
  const [ridPhotosIds, setRidPhotosIds] = useState();

  function editRoom(room, ridTitle, title, ridDescription, description, ridCapacity, capacity, ridPrice, price, ridPhotosIds, photosIds){
  
  var change = 0;
  
  if(ridTitle === room.rid){
    if(title !== ""){
      change = 1;
      ref.doc(room.rid).update({
        title: title});
      document.getElementById(`${room.title}`).value = "";
      setTitle("");
    }
  }
    if(description !== ""  && ridDescription === room.rid){
      change = 1;
      ref.doc(room.rid).update({
        description: description});
      document.getElementById(`${room.description}`).value = "";
      setDescription("");
    } 
    if(capacity != null  && ridCapacity === room.rid){
      change = 1;
      ref.doc(room.rid).update({
        capacity: capacity});
      document.getElementById(`${room.capacity}`).value = "";
      setCapacity(null);
    }
    if(price != null  && ridPrice === room.rid){
      change = 1;
      ref.doc(room.rid).update({
        price: price});
      document.getElementById(`${room.price}`).value = "";
      setPrice(null);
    }
    if(photosIds !== ""  && ridPhotosIds === room.rid){
      change = 1;
      ref.doc(room.rid).update({
        photosIds: photosIds});
      document.getElementById(`${room.photosIds}`).value = "";
      setPhotosIds("");
    }

    if(change === 1){
      ref.doc(room.rid).update({}).then(() => {
        alert("room changed");
        window.location.reload();
      })
    }
  };
  function deleteRoom(room){
    ref.doc(room.rid).delete().then(() => {
      alert("room deleted");
      window.location.reload();
  });
  }

  function getRooms() {
    ref.onSnapshot((querySnapshot) => {
      const items = [];
      querySnapshot.forEach((doc) => {
        items.push(doc.data());
      });
      setRooms(items);
    })
  }

  useEffect(() => {
    getRooms();
  }, []);

  return (
    <header>
      <h1 className={classes.title}>Room List</h1>
      <section className={classes.title}>
        <lin>
          <button><Link to="/add">Add Room</Link></button>
        </lin>
      </section>
      {rooms.map((room) => (
        <div key={room.rid}>
          <section className={classes.auth}>
            <div>Id: {room.rid}</div>
            <div>Name: {room.title}</div>
            <div>Description: {room.description}</div>
            <div>Capacity: {room.capacity}</div>
            <div>Price: {room.price}</div>
            <div><img className={classes.photo} src={room.photosIds} alt="display"/></div>
            <div><input type="text" id={`${room.title}`} placeholder="Title" onChange={(e) => {setTitle(e.target.value); setRidTitle(room.rid)}}></input></div>
            <div><input type="text" id={`${room.description}`} placeholder="Description" onChange={(e) => {setDescription(e.target.value); setRidDescription(room.rid)}}></input></div>
            <div><input type="number" id={`${room.capacity}`} placeholder="Capacity" onChange={(e) => {setCapacity(e.target.value); setRidCapacity(room.rid)}}></input></div>
            <div><input type="number" id={`${room.price}`} placeholder="Price" onChange={(e) => {setPrice(e.target.value); setRidPrice(room.rid)}}></input></div>
            <div><input type="text" id={`${room.photosIds}`} placeholder="Photo" onChange={(e) => {setPhotosIds(e.target.value); setRidPhotosIds(room.rid)}}></input></div>
            <button onClick={() => editRoom(room, ridTitle, title, ridDescription, description, ridCapacity, capacity, ridPrice, price, ridPhotosIds, photosIds)}>Edit Room</button>
            <button onClick={() => deleteRoom(room)}>Delete Room</button>
          </section>
        </div>
      ))}
    </header>

  );
};

export {ref};
export default RoomList;