import React, { useEffect, useState } from 'react';

const description = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('description mounted');
    }, []);

    return (
        <div>
            <h1>description Component</h1>
        </div>
    );
};

export default description;
