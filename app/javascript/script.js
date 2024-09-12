document.addEventListener('DOMContentLoaded', function() {
  const posts = [
    { title: 'Post 1', url: '/posts/1' },
    { title: 'Post 2', url: '/posts/2' },
    { title: 'Post 3', url: '/posts/3' },
    // Add more posts as needed
  ];

  if (posts.length === 0) {
    console.error('No posts available.');
    return;
  }

  const randomPostsContainer = document.getElementById('random-posts');
  if (!randomPostsContainer) {
    console.error('Random posts container not found.');
    return;
  }

  const numberOfPosts = 3; // Number of random posts to display

  for (let i = 0; i < numberOfPosts; i++) {
    const randomIndex = Math.floor(Math.random() * posts.length);
    const post = posts[randomIndex];

    const listItem = document.createElement('li');
    const link = document.createElement('a');
    link.href = post.url;
    link.textContent = post.title;

    listItem.appendChild(link);
    randomPostsContainer.appendChild(listItem);
  }

  console.log('Random posts added successfully.');
});
