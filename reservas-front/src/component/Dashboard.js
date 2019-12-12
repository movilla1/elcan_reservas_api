import React from 'react';

const Dashboard = props => {
  return ( 
    <div>
      <div>
        <h1>Elcan Reservas</h1>
        <p>Status: {props.loggedInStatus ? "Logged in" : "Not logged in"} </p>
      </div>
    </div>
   );
}
 
export default Dashboard;