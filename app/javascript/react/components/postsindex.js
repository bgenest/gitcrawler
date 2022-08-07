import React, {useEffect, useState} from "react";
import PostComponent from "./postComponent";

const postsIndex = (props) => {
  const [posts, setPosts] = useState([])

  const getPosts = async () => {
    try {
      const response = await fetch('/api/v1/posts')
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`
        const error = new Error(errorMessage)
        throw(error)
      }
      const postsData = await response.json()
      console.log(postsData)
      setPosts(postsData)
    } catch (error) {
      console.error(`Error in fetch: ${error.message}`)
    }
  }
  useEffect(() => {
    getPosts()
  }, [])

  const postComponents = posts.map((post) => {
    return <PostComponent 
      key={post.id}
      name={post.name}
      description={post.description}
      language={post.language}
      primary_contributers={post.primary_contributers}
    />
  })
  
  return (
    <div>
    <h1>
      List of Posts
    </h1>
    <ul>
      {postComponents}
    </ul>
</div>

  )
}

export default postsIndex