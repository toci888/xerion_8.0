import React, { useEffect, useState } from 'react';

const quizzes-list-component = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('quizzes-list-component mounted');
    }, []);

    return (
        <div>
            <h1>quizzes-list-component Component</h1>
        </div>
    );
};

export default quizzes-list-component;
