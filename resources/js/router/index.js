import { createRouter, createWebHistory } from 'vue-router';

import PostList from '../components/PostList.vue';
import PostDetail from '../components/PostDetail.vue';
import PostEdit from '../components/PostEdit.vue';

const routes = [
    {
        path: '/',
        name: 'home',
        component: PostList, 
    },
    {
        path: '/post/:id',
        name: 'post-detail',
        component: PostDetail, 
        props: true, 
    },
    {
        path: '/post/edit/:id',
        name: 'post-edit',
        component: PostEdit,
        props: true, 
    },
];

const router = createRouter({
    history: createWebHistory(), 
    routes, 
});

export default router;
