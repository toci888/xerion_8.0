import React, { useEffect, useState } from 'react';

const multi-choice-question = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('multi-choice-question mounted');
    }, []);

    return (
        <div>
            <h1>multi-choice-question Component</h1>
        </div>
    );
};

export default multi-choice-question;
