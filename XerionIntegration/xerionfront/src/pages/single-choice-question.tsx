import React, { useEffect, useState } from 'react';

const single-choice-question = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('single-choice-question mounted');
    }, []);

    return (
        <div>
            <h1>single-choice-question Component</h1>
        </div>
    );
};

export default single-choice-question;
