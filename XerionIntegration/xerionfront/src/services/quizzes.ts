import axios from 'axios';

const quizzes = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default quizzes;
