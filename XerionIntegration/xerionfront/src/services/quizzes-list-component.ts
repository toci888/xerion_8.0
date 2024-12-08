import axios from 'axios';

const baseUrl = 'https://api.example.com';

export const quizzes-list-component = async (): Promise<any> => {
    const response = await axios.get(\\/endpoint\);
    return response.data;
};

export default quizzes-list-component;
