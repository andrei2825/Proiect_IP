import { useState } from 'react'
import { ref } from './RoomList'
import { v4 as uuidv4} from "uuid"

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
      <h2>
        <input type="text" id="rid1" placeholder="rid" onChange={(e) => setRid(e.target.value)}></input>
        <input type="text" id="title1" placeholder="title" onChange={(e) => setTitle(e.target.value)}></input>
        <input type="text" id="description1" placeholder="description" onChange={(e) => setDescription(e.target.value)}></input>
        <input type="text" id="capacity1" placeholder="capacity" onChange={(e) => setCapacity(e.target.valueAsNumber)}></input>
        <input type="text" id="price1" placeholder="price" onChange={(e) => setPrice(e.target.valueAsNumber)}></input>
        <input type="text" id="photosIds1" placeholder="photosIds" onChange={(e) => setPhotosIds(e.target.value)}></input>
        <button onClick={() => {
            CreateRoom({rid,title,description,capacity,price,photosIds,id: uuidv4()})
          document.getElementById("rid1").value = ""
          document.getElementById("title1").value = ""
          document.getElementById("description1").value = ""
          document.getElementById("capacity1").value = ""
          document.getElementById("price1").value = ""
          document.getElementById("photosIds1").value = ""
        }}>Add Room</button>
      </h2>
    )
  }

  export default NewRoom