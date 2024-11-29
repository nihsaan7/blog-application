import './bootstrap';
import { createApp } from 'vue';


const app = createApp({});

import ExampleComponent from './components/ExampleComponent.vue';
app.component('example-component', ExampleComponent);

import PostList from './components/PostList.vue';
app.component('post-list', PostList);

import PostCreateForm from './components/PostCreateForm.vue';
app.component('post-create-form', PostCreateForm);

import PostEditForm from './components/PostEditForm.vue';
app.component('post-edit-form', PostEditForm);

import PostDeletedList from './components/PostDeletedList.vue';
app.component('post-deleted-list', PostDeletedList);


app.mount('#app');
