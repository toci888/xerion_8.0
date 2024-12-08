import React, { useEffect, useState } from 'react';

const edit-user-profile-grid = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('edit-user-profile-grid mounted');
    }, []);

    return (
        <div>
            <h1>edit-user-profile-grid Component</h1>
        </div>
    );
};

export default edit-user-profile-grid;
