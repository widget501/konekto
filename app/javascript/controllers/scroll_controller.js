import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["posts"]

  connect() {
    this.loadMorePosts()
  }

  loadMorePosts() {
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
      this.fetchPosts()
    }
  }

  fetchPosts() {
    fetch('/categories')
    .then(response => response.json())
    .then(data => {
      this.postsTarget.insertAdjacentHTML("beforeend", data.html)
    })
  }
}
