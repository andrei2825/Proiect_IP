import classes from './Edit.module.css';
import { storage } from "../../firebase"
import {ref, uploadBytes} from "firebase/storage"
import { useState } from 'react'
import { v4 } from "uuid"
import NewRoom from '../Rooms/NewRoom'

const Edit = () => {

    const [image, setImage]= useState(null);
    const uploadImage = () => {
        if(image == null) return;
        const imageRef = ref(storage, `${image.name + v4()}`)
        uploadBytes(imageRef, image).then(() => {
            alert("image uploaded");
        })

    }
    return (
        <header>
            <h1 className={classes.title}>Edit List</h1>
            <section className={classes.auth}>
                <div><input type="file" onChange={(e) => {setImage(e.target.files[0])}}/></div>
                <div><button onClick={uploadImage}> Upload Photo </button></div>
            </section>
            <NewRoom>
            </NewRoom>
        </header>

    
      );

}
export default Edit;