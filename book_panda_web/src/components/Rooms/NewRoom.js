import { useState } from 'react'
import { ref } from './RoomList'
import { v4 as uuidv4} from "uuid"
import classes from './RoomList.module.css'

const NewRoom = () => {

    const [rid, setRid] = useState();
    const [title, setTitle] = useState();
    const [description, setDescription] = useState();
    const [capacity, setCapacity] = useState();
    const [price, setPrice] = useState();
    const [photosIds, setPhotosIds] = useState();

    function CreateRoom(data){
        ref.doc(data.rid).set(data);
    }
  
    return(
    <div>
      <div className={classes.add}>
        <div className={classes.new}>
            <div><input type="text" id="rid1" placeholder="Id" onChange={(e) => setRid(e.target.value)}></input></div>
            <div><input type="text" id="title1" placeholder="Title" onChange={(e) => setTitle(e.target.value)}></input></div>
            <div><input type="text" id="description1" placeholder="Description" onChange={(e) => setDescription(e.target.value)}></input></div>
            <div><input type="number" id="capacity1" placeholder="Capacity" onChange={(e) => setCapacity(e.target.valueAsNumber)}></input></div>
            <div><input type="number" id="price1" placeholder="Price" onChange={(e) => setPrice(e.target.valueAsNumber)}></input></div>
            <div><input type="text" id="photosIds1" placeholder="Photo" onChange={(e) => setPhotosIds(e.target.value)}></input></div>
        </div>
        <button onClick={() => {
            CreateRoom({rid,title,description,capacity,price,photosIds,id: uuidv4()})
          document.getElementById("rid1").value = ""
          document.getElementById("title1").value = ""
          document.getElementById("description1").value = ""
          document.getElementById("capacity1").value = ""
          document.getElementById("price1").value = ""
          document.getElementById("photosIds1").value = ""
        }}>Add Room</button>
      </div>
    </div>
    )
  }

  export default NewRoom