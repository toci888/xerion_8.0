import React, { useEffect, useState } from 'react';

const questions = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('questions mounted');
    }, []);

    return (
        <div>
            <h1>questions Component</h1>
        </div>
    );
};

export default questions;
