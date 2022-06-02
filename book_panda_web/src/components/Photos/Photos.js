import classes from './Photos.module.css';
import { storage } from "../../firebase"
import {ref, uploadBytes } from "firebase/storage"
import { useState } from 'react'
import { v4 } from "uuid"

const Photos = () => {

    const [image, setImage] = useState(null);

    const uploadImage = () => {

        if(image == null) return;
        const imageRef = ref(storage, `${image.name + v4()}`)
        uploadBytes(imageRef, image).then(() => {
            alert("image uploaded");
            window.location.reload();
        })
    }
      
    return (
        <header>
            <h1 className={classes.title}>Photos List</h1>
            <section className={classes.auth}>
                <div><input type="file" onChange={(e) => {setImage(e.target.files[0])}}/></div>
                <div><button onClick={uploadImage}> Upload Photo </button></div>
            </section>
        </header>

    
      );

}
export default Photos;