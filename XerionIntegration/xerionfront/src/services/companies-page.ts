import axios from 'axios';

const companies-page = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default companies-page;
