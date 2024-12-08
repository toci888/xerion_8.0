import React, { useEffect, useState } from 'react';

const edit-user-profile = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('edit-user-profile mounted');
    }, []);

    return (
        <div>
            <h1>edit-user-profile Component</h1>
        </div>
    );
};

export default edit-user-profile;
