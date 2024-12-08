import axios from 'axios';

const result = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default result;
