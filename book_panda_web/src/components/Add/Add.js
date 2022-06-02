import classes from './Add.module.css';
import NewRoom from '../Rooms/NewRoom';

const Add = () => {
    return (
        <header>
            <h1 className={classes.title}>Add Room</h1>
            <NewRoom>
            </NewRoom>
        </header>
    );
}
export default Add;