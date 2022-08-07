import React from 'react'
import { BrowserRouter,Switch,routes, Route } from 'react-router-dom'

import postsIndex from './postsindex'

export const App = (props) => {
  return (
    <BrowserRouter>
    <Route path = "/" component ={postsIndex}/>
    </BrowserRouter>
  )
}

export default App
