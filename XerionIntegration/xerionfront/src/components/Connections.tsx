import React, { useState } from 'react';
import axios from 'axios';

const Connections: React.FC = () => {
    const [profession, setProfession] = useState('');
    const [location, setLocation] = useState('');
    const [users, setUsers] = useState([]);

    const searchUsers = async () => {
        const response = await axios.get(/api/Connections/search, {
            params: { profession, location },
        });
        setUsers(response.data);
    };

    const addConnection = async (userId: number) => {
        await axios.post(/api/Connections, {
            userId,
            connectedUserId: 1, // Example current user ID
        });
        alert('Connection added!');
    };

    return (
        <div>
            <h1>Find Professionals</h1>
            <input
                type=""text""
                placeholder=""Profession""
                value={profession}
                onChange={(e) => setProfession(e.target.value)}
            />
            <input
                type=""text""
                placeholder=""Location""
                value={location}
                onChange={(e) => setLocation(e.target.value)}
            />
            <button onClick={searchUsers}>Search</button>

            <ul>
                {users.map((user: any) => (
                    <li key={user.id}>
                        {user.name} ({user.profession})
                        <button onClick={() => addConnection(user.id)}>Add Connection</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default Connections;
