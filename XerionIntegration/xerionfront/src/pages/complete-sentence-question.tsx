import React, { useEffect, useState } from 'react';

const complete-sentence-question = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('complete-sentence-question mounted');
    }, []);

    return (
        <div>
            <h1>complete-sentence-question Component</h1>
        </div>
    );
};

export default complete-sentence-question;
