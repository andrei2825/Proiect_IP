import { Switch, Route, Redirect } from "react-router-dom";
import { useContext } from "react";

import Layout from "./components/Layout/Layout";
//import UserProfile from "./components/Profile/UserProfile";
import AuthPage from "./pages/AuthPage";
import HomePage from "./pages/HomePage";
import RoomsPage from "./pages/RoomsPage";
import RequestsPage from "./pages/RequestsPage";
import AuthContext from "./store/AuthContext";
import BookingsPage from "./pages/BookingsPage";
import EditPage from "./pages/EditPage";

function App() {
  const isLoggedin = useContext(AuthContext).isLoggedin;

  return (
    <Layout>
      <Switch>
        <Route path="/" exact>
          <HomePage />
        </Route>
        <Route path="/auth">
          {!isLoggedin && <AuthPage />}
          {isLoggedin && <Redirect to="/rooms" />}
        </Route>
        <Route path="/rooms">
          {isLoggedin && <RoomsPage />}
          {!isLoggedin && <Redirect to="/auth" />}
        </Route>
        <Route path="/requests">
          {isLoggedin && <RequestsPage />}
          {!isLoggedin && <Redirect to="/auth" />}
        </Route>
        <Route path="/bookings">
          {isLoggedin && <BookingsPage />}
          {!isLoggedin && <Redirect to="/auth" />}
        </Route>
        <Route path="/edit">
          {isLoggedin && <EditPage />}
          {!isLoggedin && <Redirect to="/auth" />}
        </Route>
        <Route path="*">
          <Redirect to="/" />
        </Route>
      </Switch>
    </Layout>
  );
}

export default App;
