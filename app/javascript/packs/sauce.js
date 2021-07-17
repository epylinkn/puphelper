import React from "react";
import { render } from "react-dom";
import DogRoot from "../components/DogRoot";

document.addEventListener("DOMContentLoaded", () => {
  render(<DogRoot />, document.getElementById('sauceindex'));
});
