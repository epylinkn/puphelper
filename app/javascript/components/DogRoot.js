import React, { useEffect, useState } from "react";

const DogRoot = () => {
  const [dogs, setDogs] = useState([])

  useEffect(() => {
    async function fetchDogs() {
      let response = await fetch('/api/v1/dogs')
      response = await response.json()
      setDogs(response)
    }

    fetchDogs()
  }, [])

  if (dogs.length == 0) {
    return (
      <div className="container">
        <h1>NO DOGS</h1>
      </div>
    )
  }

  return (
    <div className="container">
      {dogs.map((dog, i) => (
        <p key={i}>
          <strong>Name:</strong>
          {dog.name}
        </p>
      ))}
    </div>
  )
}

export default DogRoot;
