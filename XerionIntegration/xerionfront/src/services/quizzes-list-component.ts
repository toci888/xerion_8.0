import axios from 'axios';

const quizzes-list-component = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default quizzes-list-component;
