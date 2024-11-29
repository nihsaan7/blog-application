<template>
    <div class="posts-container">
        <h1><b>Deleted Posts List</b></h1>
      
        <div class="responsive-table">
            <table v-if="posts.length" class="posts-table">
                <thead>
                    <tr>
                        <th width="2%">#ID</th>
                        <th width="10%">Image</th>
                        <th width="33%">Title</th>
                        <th width="10%">Category</th>
                        <th width="30%">Tags</th>
                        <th width="15%">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="post in posts" :key="post.id">
                        <td>{{ post.id }}</td>
                        <td>
                            <img 
                                :src="post.image ? `${basePath}/${post.image}` : defaultImage" 
                                :alt="post.title" 
                                class="post-image text-center"
                                width="60%"
                            />
                        </td>
                        <td>{{ post.title }}</td>
                        <td>{{ post.category || 'No Category' }}</td>
                        <td>
                            <span v-for="(tag, index) in post.tags" :key="index" class="tag">
                                {{ tag }}
                            </span>
                        </td>
                        <td>
                         
                            <!-- restore Button -->
                            <button @click="restorePost(post.id)" class="btn btn-sm btn-warning mt-1 delete-btn"><i class="fa fa-undo" aria-hidden="true"></i> Restore</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p v-else class="no-posts-msg">No posts available.</p>
        </div>
        
        <!-- Pagination Controls -->
        <div v-if="meta" class="pagination">
            <button 
                :disabled="meta.current_page === 1" 
                @click="fetchPosts(meta.current_page - 1)"
                class="pagination-btn"
            >
                Previous
            </button>
            <span class="pagination-info">Page {{ meta.current_page }} of {{ meta.last_page }}</span>
            <button 
                :disabled="meta.current_page === meta.last_page" 
                @click="fetchPosts(meta.current_page + 1)"
                class="pagination-btn"
            >
                Next
            </button>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            posts: [],
            meta: null,
            basePath: '/storage',
            defaultImage: '/images/no-image.jpg',
        };
    },
    mounted() {
        this.fetchPosts(); // Fetch initial posts
    },
    methods: {
        fetchPosts(page = 1) {
            axios.get(`/api/all-deleted-posts?page=${page}`)
                .then(response => {
                    console.log('API Response:', response.data);
                    this.posts = response.data.data; // Access the posts array
                    this.meta = response.data.meta; // Store metadata
                })
                .catch(error => {
                    console.error('Error fetching posts:', error);
                });
        },
        // Delete post function
        restorePost(postId) {
            if (confirm("Are you sure you want to restore this post?")) {
                axios.get(`/api/restore-post/${postId}`)
                    .then(response => {
                        this.fetchPosts(); // Re-fetch the posts after deletion
                        alert("Post restored successfully!");
                    })
                    .catch(error => {
                        console.error('Error restoring post:', error);
                    });
            }
        },
    },
};
</script>

<style scoped>
/* Base Styles */
.posts-container {
    padding: 20px;
    font-family: Arial, sans-serif;
}

h1 {
    margin-bottom: 20px;
    font-size: 24px;
    text-align: center;
}

/* Table Styles */
.responsive-table {
    overflow-x: auto; /* Allow horizontal scrolling for small screens */
    margin-bottom: 20px;
}

.posts-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.posts-table th, .posts-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.posts-table th {
    background-color: #f2f2f2;
    font-weight: bold;
}

.posts-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.posts-table tr:hover {
    background-color: #f1f1f1;
}

.no-posts-msg {
    color: #555;
    font-style: italic;
    text-align: center;
    margin-top: 20px;
}

/* Pagination Styles */
.pagination {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 10px;
}

.pagination-btn {
    padding: 10px 15px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.pagination-btn:disabled {
    background-color: #d6d6d6;
    cursor: not-allowed;
}

.pagination-info {
    font-size: 16px;
    color: #555;
}

/* Tag Styles */
.tag {
    display: inline-block;
    margin: 2px;
    padding: 2px 8px;
    background-color: #e0e0e0;
    border-radius: 12px;
    font-size: 12px;
}


/* Responsive Design */
@media screen and (max-width: 768px) {    

    .posts-table th, .posts-table td {
        font-size: 14px;
        padding: 8px;
    }

    .pagination {
        flex-direction: column;
        align-items: center;
    }

    .pagination-btn {
        width: 100%;
        margin-bottom: 10px;
    }

    .pagination-info {
        margin-bottom: 10px;
        text-align: center;
    }
}
</style>
