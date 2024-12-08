import axios from 'axios';

const timer = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default timer;
