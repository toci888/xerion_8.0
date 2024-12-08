import axios from 'axios';

const edit-user-profile = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default edit-user-profile;
