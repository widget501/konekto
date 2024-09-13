document.addEventListener('DOMContentLoaded', function() {
  const posts = [
    { title: 'Post 1', url: '/posts/1' },
    { title: 'Post 2', url: '/posts/2' },
    { title: 'Post 3', url: '/posts/3' },
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

  const numberOfPosts = 3;
  const selectedIndices = new Set();

  while (selectedIndices.size < numberOfPosts && selectedIndices.size < posts.length) {
    const randomIndex = Math.floor(Math.random() * posts.length);
    if (!selectedIndices.has(randomIndex)) {
      selectedIndices.add(randomIndex);

      const post = posts[randomIndex];
      const listItem = document.createElement('li');
      const link = document.createElement('a');
      link.href = post.url;
      link.textContent = post.title;

      listItem.appendChild(link);
      randomPostsContainer.appendChild(listItem);
    }
  }

  console.log('Random posts added successfully.');
});
