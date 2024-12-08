import axios from 'axios';

const quiz-solve = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default quiz-solve;
