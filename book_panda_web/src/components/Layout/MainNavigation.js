import { useContext } from "react";
import { Link } from "react-router-dom";

import classes from "./MainNavigation.module.css";
import AuthContext from "../../store/AuthContext";

const MainNavigation = () => {
  const authContext = useContext(AuthContext);
  const isLoggedin = authContext.isLoggedin;

  const logoutHandler = () => {
    authContext.logout();
  };

  return (
    <header className={classes.header}>
      <Link to="/">
        <div className={classes.logo}>React Auth</div>
      </Link>
      <nav>
        <ul>
          {!isLoggedin && (
            <li>
              <Link to="/auth">Login</Link>
            </li>
          )}
          {isLoggedin && (
            <li>
              <Link to="/profile">Profile</Link>
            </li>
          )}
          {isLoggedin && (
            <li>
              <button onClick={logoutHandler}>Logout</button>
            </li>
          )}
        </ul>
      </nav>
    </header>
  );
};

export default MainNavigation;
