<template>
    <div class="post-form-container">
        <h1>Edit Post</h1>
        <form @submit.prevent="savePost">
            <!-- Title Field -->
            <div class="form-group" :class="{'has-error': titleError}">
                <label for="title">Title</label>
                <input 
                    type="text" 
                    id="title" 
                    v-model="post.title" 
                    required 
                    placeholder="Enter the title" 
                    maxlength="100"
                />
                <span v-if="titleError" class="error-message">{{ titleError }}</span>
            </div>

            <!-- Content Field -->
            <div class="form-group" :class="{'has-error': contentError}">
                <label for="content">Content</label>
                <textarea 
                    id="content" 
                    v-model="post.content" 
                    required 
                    placeholder="Enter the post content"
                ></textarea>
                <span v-if="contentError" class="error-message">{{ contentError }}</span>
            </div>

            <!-- Category Field (Dropdown) -->
            <div class="form-group" :class="{'has-error': categoryError}">
                <label for="category">Category</label>
                <select 
                    id="category" 
                    v-model="post.category" 
                    required
                >
                    <option value="" disabled>Select Category</option>
                    <option v-for="category in categories" :key="category.id" :value="category.name">
                        {{ category.name }}
                    </option>
                </select>
                <span v-if="categoryError" class="error-message">{{ categoryError }}</span>
            </div>

            <!-- Tags Field -->
            <div class="form-group" :class="{'has-error': tagsError}">
                <label for="tags">Tags</label>
                <input 
                    type="text" 
                    id="tags" 
                    v-model="tagsInput" 
                    placeholder="Comma separated tags"
                    required
                />
                <span v-if="tagsError" class="error-message">{{ tagsError }}</span>
            </div>

            <!-- Image Field -->
            <div class="form-group" :class="{'has-error': imageError}">
                <label for="image">Post Image (Optional) (Max Size Should be 2048kb)</label>
                <input 
                    type="file" 
                    id="image" 
                    accept="image/jpeg, image/png, image/jpg, image/gif"
                    @change="handleImageChange"
                />
                <div v-if="post.image">
                    <img :src="getImageUrl(post.image)" width="20%" alt="Post Image" class="image-preview" />
                </div>
                <span v-if="imageError" class="error-message">{{ imageError }}</span>
            </div>

            <!-- Submit Button -->
            <button 
                type="submit" 
                class="submit-btn" 
                :disabled="isFormInvalid"
            >
                Update Post
            </button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            post: {
                id: null,
                title: '',
                content: '',
                category: '',
                tags: [],
                image: null,
            },
            tagsInput: '',
            categories: [], 
            isEditMode: true,
            titleError: null,
            contentError: null,
            categoryError: null,
            tagsError: null,
            imageError: null,
        };
    },
    computed: {
        isFormInvalid() {
            // return this.titleError || this.contentError || this.imageError || this.tagsError || this.categoryError;
        }
    },
    mounted() {
        this.fetchCategories(); // Fetch categories when the component mounts
        
        const currentPath = window.location.pathname;
        const pathParts = currentPath.split('/');

        if (pathParts.length > 3) {
            const parameter3 = pathParts[3]; 
            if (parameter3) {
                this.isEditMode = true;
                this.fetchPost(parameter3);
            }
        }
    },
    methods: {
        // Fetch the list of categories from the server
        fetchCategories() {
            axios.get('/api/categories')
                .then(response => {
                    this.categories = response.data.data;
                })
                .catch(error => {
                    console.error('Error fetching categories:', error);
                });
        },

        // Fetch post data for editing
        fetchPost(postId) {
            axios.get(`/api/post-details/${postId}`)
                .then(response => {
                    const post = response.data.data;
                    this.post = {
                        id: post.id,
                        title: post.title,
                        content: post.content,
                        category: post.category, // Directly assign the category name
                        tags: post.tags,
                        image: post.image,
                    };
                    this.tagsInput = post.tags.join(', '); // Pre-fill tags input
                })
                .catch(error => {
                    console.error('Error fetching post data:', error);
                });
        },

        // Generate the image URL based on the backend image path
        getImageUrl(imagePath) {
            return `/storage/${imagePath}`;
        },

        
        handleImageChange(event) {
            const file = event.target.files[0];
            if (file) {
                this.post.image = file; 
            }
        },

       
        savePost() {
            // Validate form inputs
            this.validateForm();

            // If any error exists, prevent submission
            if (this.titleError || this.contentError || this.imageError || this.tagsError || this.categoryError) {
                return;
            }

            // Split tags by commas and trim them
            const tagsArray = this.tagsInput.split(',').map(tag => tag.trim());
            const formData = new FormData();

            // Append form data fields
            formData.append('title', this.post.title);
            formData.append('content', this.post.content);
            formData.append('category', this.post.category);
            tagsArray.forEach(tag => formData.append('tags[]', tag));
        
            if (this.post.image) {
                formData.append('image', this.post.image);
            }

            // Send the API request
            const request = axios.put(`/api/posts-update/${this.post.id}`, formData);

            request
                .then(response => {
                    window.location.href = '/admin/posts';
                    alert('Post updated successfully!');
                })
                .catch(error => {
                    alert('Error updating post:', error);
                });
        },

        // Form validation for required fields
        validateForm() {
            this.titleError = this.post.title ? (this.post.title.length > 100 ? 'Title must be less than 100 characters' : null) : 'Title is required';
            this.contentError = this.post.content ? null : 'Content is required';
            this.categoryError = this.post.category ? null : 'Category is required';
            this.tagsError = this.tagsInput ? null : 'Tags are required';
        }
    }
};
</script>

<style scoped>
/* Post Form Container */
.post-form-container {
    margin-top: 25px !important;
    padding: 30px;
    max-width: 600px;
    margin: 0 auto;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    font-weight: bold;
    margin-bottom: 5px;
    display: block;
    font-size: 14px;
}

.form-group input, .form-group textarea, .form-group select {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-top: 5px;
}

.form-group input:focus, .form-group textarea:focus, .form-group select:focus {
    border-color: #007bff;
    outline: none;
}

/* Error Message Styling */
.has-error input, .has-error textarea, .has-error select {
    border-color: red;
}

.error-message {
    color: red;
    font-size: 12px;
    margin-top: 5px;
}

/* Button Styles */
.submit-btn {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.submit-btn:disabled {
    background-color: #d6d6d6;
    cursor: not-allowed;
}

.submit-btn:hover {
    background-color: #0056b3;
}

/* Image Preview */
.image-preview {
    margin-top: 10px;
    max-width: 100%;
    height: auto;
    border: 1px solid #ddd;
    border-radius: 4px;
}

/* Responsive Design */
@media screen and (max-width: 768px) {
    .post-form-container {
        padding: 20px;
    }

    .submit-btn {
        font-size: 14px;
        padding: 10px;
    }

    h1 {
        font-size: 20px;
    }

    .form-group input, .form-group textarea, .form-group select {
        font-size: 13px;
        padding: 8px;
    }
}
</style>
