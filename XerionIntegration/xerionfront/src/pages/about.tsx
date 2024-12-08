import React, { useEffect, useState } from 'react';

const about = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('about mounted');
    }, []);

    return (
        <div>
            <h1>about Component</h1>
        </div>
    );
};

export default about;
