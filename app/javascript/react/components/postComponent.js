import React from "react";

const PostComponent =(props)=>{
  return (
    <div>
      <p>Name: {props.name}</p>
      <p>Description: {props.description}</p>
      <p>Language: {props.language}</p>
      <p>Primary_Contributers: {props.primary_contributers}</p>
      <br/>
    </div>
  )
}

export default PostComponent