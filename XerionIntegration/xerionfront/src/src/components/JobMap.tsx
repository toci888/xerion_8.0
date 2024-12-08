import React, { useEffect, useState } from 'react';
import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet';
import axios from 'axios';

interface Job {
    id: number;
    title: string;
    company: string;
    latitude: number;
    longitude: number;
}

const JobMap: React.FC = () => {
    const [jobs, setJobs] = useState<Job[]>([]);

    useEffect(() => {
        const fetchJobs = async () => {
            const response = await axios.get('/api/Jobs/map');
            setJobs(response.data);
        };
        fetchJobs();
    }, []);

    return (
        <MapContainer center={[52.2297, 21.0122]} zoom={10} style={{ height: '100vh', width: '100%' }}>
            <TileLayer
                url=""https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png""
                attribution=""&copy; <a href='https://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors""
            />
            {jobs.map((job) => (
                <Marker key={job.id} position={[job.latitude, job.longitude]}>
                    <Popup>
                        <strong>{job.title}</strong> <br />
                        {job.company}
                    </Popup>
                </Marker>
            ))}
        </MapContainer>
    );
};

export default JobMap;
