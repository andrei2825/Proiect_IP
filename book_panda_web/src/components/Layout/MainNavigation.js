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
        <div className={classes.logo}>
          <color>BookPanda</color>
        </div>
      </Link>
      <nav>
        <ul>
          {!isLoggedin && (
            <lin>
              <Link to="/auth">Login</Link>
            </lin>
          )}
          {isLoggedin && (
            <lout>
              <button onClick={logoutHandler}>Logout</button>
            </lout>
          )}
        </ul>
      </nav>
    </header>
  );
};

export default MainNavigation;
