import React from 'react'
import {BrowserRouter as Router,Route} from 'react-router-dom'
import AccountDetails from './components/AccountDetails/AccountDetails'
import CreateAccount from './components/CreateAccount/CreateAccount'
import DisplayAccounts from './components/DisplayAccounts/DisplayAccounts'
import MainSection from './components/MainSection/MainSection'


const Routing = () => {
    return (
      <div>
        <Router>

          <Route exact path="/">
            <MainSection />
          </Route>
          <Route exact path="/create">
            <CreateAccount />
          </Route>
          <Route exact path="/accounts">
            <DisplayAccounts />
          </Route>
          <Route exact path="/accounts/:id">
            <AccountDetails />
          </Route>
         
        </Router>
      </div>
    );
}

export default Routing
