import React, { useEffect, useState } from 'react';

const icon = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('icon mounted');
    }, []);

    return (
        <div>
            <h1>icon Component</h1>
        </div>
    );
};

export default icon;
